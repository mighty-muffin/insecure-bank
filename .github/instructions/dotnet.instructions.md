---
applyTo: '**/*.cs'
description: 'C# (.NET) coding conventions and guidelines'
---

# C# Coding Conventions

## C# Instructions

- Write XML documentation comments (`///`) for all public classes, methods, and properties.
- Use descriptive names for classes, methods, and variables that clearly convey intent.
- Follow C# naming conventions: `PascalCase` for classes/methods/properties, `camelCase` for local variables and parameters, `_camelCase` for private fields.
- Use strong typing; avoid `dynamic` and `object` unless necessary.
- Prefer `async`/`await` for all I/O-bound operations; avoid blocking calls (`.Result`, `.Wait()`).
- This project uses **ASP.NET Core 3.1 Razor Pages**; follow Razor Pages conventions for page models, handlers (`OnGet`, `OnPost`), and view binding.
- **Entity Framework Core** is the ORM; use the `ApplicationDbContext` and avoid raw SQL where possible. When raw SQL is necessary, use parameterised queries.
- Follow the **DAO / Facade** architectural pattern established in this project:
  - `Dao/` — data access interfaces and implementations
  - `Facade/` — business logic interfaces and implementations
  - `Pages/` — Razor Page models (UI layer)
- Register dependencies via the DI container in `Startup.cs`; avoid service locator anti-patterns.

## General Instructions

- Always prioritize readability and clarity.
- For algorithm-related code, include comments explaining the approach.
- Write code with good maintainability practices, including comments on why certain design decisions were made.
- Handle exceptions at appropriate layers; use specific exception types rather than catching `Exception` broadly.
- For libraries or external dependencies, mention their usage and purpose in comments.
- Use consistent naming conventions and follow Microsoft's C# coding guidelines.
- Write concise, efficient, and idiomatic C# that is also easily understandable.

## Code Style and Formatting

- Follow the **Microsoft C# Coding Conventions** and the **.NET Runtime coding style**.
- Use 4 spaces for indentation (no tabs).
- Place opening braces (`{`) on the same line as the statement in methods; on a new line for class and namespace declarations.
- Keep methods short and focused on a single responsibility.
- Use `var` when the type is obvious from the right-hand side; use explicit types when clarity is needed.
- Organise `using` directives alphabetically; place `System` namespaces first.
- Use expression-bodied members (`=>`) for simple single-expression properties and methods.
- Prefer LINQ for collection operations over manual loops when it improves readability.

## Edge Cases and Testing

- Always include test cases for critical paths of the application.
- Account for common edge cases like null inputs, unauthorised access, and invalid model state.
- Include comments for edge cases and the expected behaviour in those cases.
- Write unit tests for Facade and DAO implementations; mock dependencies using interfaces.
- Use descriptive test method names following the pattern `MethodName_Scenario_ExpectedResult`.

## Example of Proper Documentation

```csharp
/// <summary>
/// Transfers funds from one account to another.
/// </summary>
/// <param name="fromAccountId">The ID of the source account.</param>
/// <param name="toAccountId">The ID of the destination account.</param>
/// <param name="amount">The amount to transfer. Must be greater than zero.</param>
/// <returns>A task that represents the asynchronous transfer operation.</returns>
/// <exception cref="InvalidOperationException">
/// Thrown when the source account has insufficient funds.
/// </exception>
public async Task TransferAsync(int fromAccountId, int toAccountId, decimal amount)
{
    var source = await _cashAccountDao.GetByIdAsync(fromAccountId);
    if (source.Balance < amount)
    {
        throw new InvalidOperationException("Insufficient funds.");
    }

    await _transferDao.CreateTransferAsync(fromAccountId, toAccountId, amount);
}
```
