Welcome to your new dbt project!

### Install dbt Core using venv
https://docs.getdbt.com/docs/core/pip-install

Create virtual env
Install dbt packages
- python -m pip install dbt-core
- python -m pip install dbt-postgres #replace with your own adapter
- dbt --version

### Using the starter project
Refer https://docs.getdbt.com/guides/manual-install?step=1


Init starter project
- dbt init jaffle_shop


Data seeds
- Put csv and seeds folders
- Configure schema mapping in project config
- Auto add dbt_*** prefixes for schema name, more refer https://docs.getdbt.com/docs/build/custom-schemas
- Seed table can be reference using {{ ref('payments') }}, and PSQL default column setting is case sensitive.


```
seeds:
  jaffle_shop:    
    schema: mappings
    jaffle_shop:
      schema: jaffle_shop
    stripe:
      schema: stripe

10:53:55  1 of 3 START seed file dbt_jaffle_shop.customers ............................... [RUN]
10:53:55  1 of 3 OK loaded seed file dbt_jaffle_shop.customers ........................... [INSERT 100 in 0.20s]
10:53:55  2 of 3 START seed file dbt_jaffle_shop.orders .................................. [RUN]
10:53:55  2 of 3 OK loaded seed file dbt_jaffle_shop.orders .............................. [INSERT 99 in 0.17s]
10:53:55  3 of 3 START seed file dbt_stripe.payments ..................................... [RUN]
10:53:56  3 of 3 OK loaded seed file dbt_stripe.payments ................................. [INSERT 120 in 0.23s]
10:53:56  
10:53:56  Finished running 3 seeds in 0 hours 0 minutes and 4.10 seconds (4.10s).
10:53:56  
10:53:56  Completed successfully
10:53:56  
10:53:56  Done. PASS=3 WARN=0 ERROR=0 SKIP=0 NO-OP=0 TOTAL=3
```
#### Test
Data Test:
- Singular data test

The simplest way to define a data test is by writing the exact SQL that will return failing records. We call these "singular" data tests, because they're one-off assertions usable for a single purpose.

Note:
  - Omit semicolons (;) at the end of the SQL statement in your singular test files, as they can cause your data test to fail.
  - Singular data tests placed in the tests directory are automatically executed when running dbt test. Don't reference singular tests in model_name.yml, as they are not treated as generic tests or macros, and doing so will result in an error.

- Generic data test

Certain data tests are generic: they can be reused over and over again. A generic data test is defined in a test block, which contains a parametrized query and accepts arguments

  - like macros
```
{% test not_null(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} is null

{% endtest %}
```

  - 4 builtin tests, unique, not_null, accepted_values and relationships.

Recommend using *data_tests* for new project, as tests is still supported for backwords-compatibility.  

```
models:
  - name: orders
    columns:
      - name: order_id
        data_tests:
          - unique
          - not_null
      - name: status
        data_tests:
          - accepted_values:
              arguments: # available in v1.10.5 and higher. Older versions can set the <argument_name> as the top-level property.
                values: ['placed', 'shipped', 'completed', 'returned']
      - name: customer_id
        data_tests:
          - relationships:
              arguments:
                to: ref('customers')
                field: id

```

Storing test failures

Set the optional --store-failures flag


Try running the following commands:
- dbt run -s model
- dbt test
- dbt docs generate  # generate docs for the project
- dbt docs serve --port 8081  # launch the doc in local website, default 8080


Unit test

https://docs.getdbt.com/docs/build/unit-tests



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
