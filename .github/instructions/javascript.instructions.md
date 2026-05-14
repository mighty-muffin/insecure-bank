---
applyTo: '**/*.js'
description: 'JavaScript (Node.js) coding conventions and guidelines'
---

# JavaScript Coding Conventions

## JavaScript Instructions

- Write clear and concise JSDoc comments for each function, including `@param` and `@returns` tags.
- Use descriptive function and variable names that clearly convey intent.
- Prefer `const` over `let`; avoid `var`.
- Use ES2021+ features where appropriate (optional chaining `?.`, nullish coalescing `??`, etc.).
- This project uses **Express.js**; follow Express best practices for routing, middleware, and error handling.
- **Sequelize** is the ORM; use models and transactions instead of raw SQL where possible.
- **Handlebars (hbs)** is the view engine; keep logic out of templates and use helper functions for formatting.
- `npm` is the package manager; keep `package.json` up to date and lock dependencies with `package-lock.json`.

## General Instructions

- Always prioritize readability and clarity over clever one-liners.
- For algorithm-related code, include comments explaining the approach.
- Write code with good maintainability practices, including comments on why certain design decisions were made.
- Handle edge cases and write clear error handling; always pass errors to the next Express middleware (`next(err)`).
- For libraries or external dependencies, mention their usage and purpose in comments.
- Use consistent naming conventions and follow JavaScript/Node.js best practices.
- Write concise, efficient, and idiomatic JavaScript that is also easily understandable.
- Prefer `async`/`await` over raw Promise chains for asynchronous code.

## Code Style and Formatting

- Follow the **ESLint standard** config rules enforced by `.eslintrc.json`.
- Use **Prettier** for formatting; configuration is in `.prettierrc.json`:
  - **No semicolons** at the end of statements.
  - **Single quotes** for strings.
  - **4 spaces** per indentation level.
  - Trailing commas in multi-line ES5 contexts (`"trailingComma": "es5"`).
- Keep lines to a reasonable length (120 characters max).
- Use blank lines to separate logical blocks, route handlers, and middleware.
- Place route-level middleware and helpers in separate files under `routes/` and `services/`.

## Edge Cases and Testing

- Always include test cases for critical paths of the application.
- Account for common edge cases like missing request body fields, invalid data types, and unauthenticated access.
- Include comments for edge cases and the expected behaviour in those cases.
- Write unit tests for service functions and integration tests for route handlers.
- Use descriptive test names that explain the scenario being tested.

## Example of Proper Documentation

```js
/**
 * Transfers funds between two accounts.
 *
 * @param {number} fromAccountId - The ID of the source account.
 * @param {number} toAccountId - The ID of the destination account.
 * @param {number} amount - The amount to transfer (must be > 0).
 * @returns {Promise<void>} Resolves when the transfer is committed.
 * @throws {Error} If either account is not found or funds are insufficient.
 */
const transferFunds = async (fromAccountId, toAccountId, amount) => {
    const t = await sequelize.transaction()
    try {
        // Debit source account
        await Account.decrement('balance', { by: amount, where: { id: fromAccountId }, transaction: t })
        // Credit destination account
        await Account.increment('balance', { by: amount, where: { id: toAccountId }, transaction: t })
        await t.commit()
    } catch (err) {
        await t.rollback()
        throw err
    }
}
```
