{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select
        order_id,

        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{payment_method}}' then amount else 0 end) as {{payment_method}}_amount,
        {% endfor -%}

        /*
        https://docs.getdbt.com/guides/using-jinja?step=1
        sum(case when payment_method = 'bank_transfer' then amount end) as bank_transfer_amount,
        sum(case when payment_method = 'credit_card' then amount end) as credit_card_amount,
        sum(case when payment_method = 'gift_card' then amount end) as gift_card_amount,
        sum(case when payment_method = 'coupon' then amount end) as coupon_amount,
        */

        sum(amount) as total_amount

    from payments

    group by 1

)

select * from final