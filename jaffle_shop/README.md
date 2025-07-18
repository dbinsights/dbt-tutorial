Welcome to your new dbt project!

### Install dbt Core using venv
https://docs.getdbt.com/docs/core/pip-install

Create virtual env
Install dbt packages
- python -m pip install dbt-core
- python -m pip install dbt-postgres #replace with your own adapter
- dbt --version

### Using the starter project
Init starter project
- dbt init jaffle_shop


Data seeds
- Put csv and seeds folders
- Configure schema mapping in project config
- Auto add dbt_*** prefixes for schema name, more refer https://docs.getdbt.com/docs/build/custom-schemas

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

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
