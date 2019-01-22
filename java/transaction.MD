## 最近遇到这些问题
No EntityManager with actual transaction available for current thread - cannot reliably process 'persist' call
需要在类上加个 org.springframework.transaction.annotation.Transactional

FactoryBean > Factory > JpaBean > method

Transaction was marked for rollback only; cannot commit
Jpa 持久化事务回滚 不允许再提交别的事务，通过不申明事务处理

JDBC transaction marked for rollback-only (exception provided for stack trace)
跟前面类似
