---
applyTo: '**/*.java'
description: 'Java coding conventions and guidelines'
---

# Java Coding Conventions

## Java Instructions

- Write Javadoc comments for all public classes, methods, and fields, including `@param`, `@return`, and `@throws` tags.
- Use descriptive names for classes, methods, and variables that clearly convey intent.
- Follow Java naming conventions: `PascalCase` for classes and interfaces, `camelCase` for methods and variables, `UPPER_SNAKE_CASE` for constants.
- Use strong typing; prefer specific types over `Object` unless generics are not viable.
- This project uses **Maven** for build management; keep `pom.xml` up to date and use Maven lifecycle goals (`clean`, `package`, `test`).
- The application runs on **Apache Tomcat** via the Maven Cargo plugin (`mvn cargo:run`); follow Servlet/Java EE conventions for request handling.
- Prefer dependency injection and interface-based programming to keep code testable and loosely coupled.
- Use checked exceptions for recoverable conditions and unchecked exceptions (`RuntimeException`) for programming errors.

## General Instructions

- Always prioritize readability and clarity.
- For algorithm-related code, include comments explaining the approach.
- Write code with good maintainability practices, including comments on why certain design decisions were made.
- Handle exceptions at appropriate layers; catch specific exceptions rather than `Exception` or `Throwable` broadly.
- Close resources (connections, streams) using try-with-resources (`try (Resource r = ...)`) to prevent leaks.
- For libraries or external dependencies, mention their usage and purpose in comments.
- Use consistent naming conventions and follow Oracle's Java Code Conventions.
- Write concise, efficient, and idiomatic Java that is also easily understandable.

## Code Style and Formatting

- Follow **Oracle's Java Code Conventions** and the **Google Java Style Guide**.
- Use 4 spaces for indentation (no tabs).
- Place opening braces (`{`) on the same line as the statement.
- Keep methods short and focused on a single responsibility; aim for methods under 30 lines.
- Limit line length to 100 characters.
- Organise imports: standard library first, then third-party, then project imports; remove unused imports.
- Use blank lines to separate logical blocks, method definitions, and class sections (fields, constructors, methods).
- Prefer enhanced for-loops and Stream API over traditional index-based loops where it improves readability.
- Use `@Override` annotation whenever overriding a method.

## Edge Cases and Testing

- Always include test cases for critical paths of the application.
- Account for common edge cases like null inputs, empty collections, invalid HTTP parameters, and unauthorised access.
- Include comments for edge cases and the expected behaviour in those cases.
- Write unit tests using **JUnit** for service and DAO layers; use mocking frameworks (e.g., Mockito) for dependencies.
- Use descriptive test method names following the pattern `methodName_scenario_expectedResult`.
- Run `mvn test` before committing changes to ensure no regressions.

## Example of Proper Documentation

```java
/**
 * Transfers funds between two bank accounts.
 *
 * <p>Both accounts must exist and the source account must have sufficient
 * balance to cover the requested amount.
 *
 * @param fromAccountId the ID of the source account
 * @param toAccountId   the ID of the destination account
 * @param amount        the amount to transfer; must be greater than zero
 * @throws IllegalArgumentException if {@code amount} is not positive
 * @throws InsufficientFundsException if the source account balance is too low
 * @throws SQLException if a database error occurs during the transfer
 */
public void transfer(int fromAccountId, int toAccountId, BigDecimal amount)
        throws SQLException {
    if (amount.compareTo(BigDecimal.ZERO) <= 0) {
        throw new IllegalArgumentException("Transfer amount must be greater than zero.");
    }

    Account source = accountDao.findById(fromAccountId);
    if (source.getBalance().compareTo(amount) < 0) {
        throw new InsufficientFundsException("Insufficient funds in account: " + fromAccountId);
    }

    accountDao.debit(fromAccountId, amount);
    accountDao.credit(toAccountId, amount);
}
```
