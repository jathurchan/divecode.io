# API Design Patterns

- [ ] Add a front matter
- [ ] [Introduction to API Design Patterns](craftdocs://open?blockId=72F0FDA6-4BC3-4587-9EF8-0E1A19907BD8&spaceId=220382df-dd92-deed-f543-c34c29908bbc)

---

- Collection of safe, flexible, reusable patterns for building web APIs → more consistent and less frustrating web API experience.
- Using **TypeScript** (~~OpenAPI~~, ~~Protocol Buffers~~),
   - API resources are defined as TypeScript interfaces.
   - API methods are defined as TypeScript abstract functions (abstract classes to represent the overarching API).
   - inputs and outputs of API methods are represented by request and response interfaces (e.g. `CreateChatRoomRequest`).
   - To map RPCs to a URL (and HTTP method), TypeScript decorators are used as annotations on the API methods (e.g. `@get("/{id=chatRooms/*}")`).

## Part 1 Introduction

1. ### Introduction to APIs
- Interfaces
   - Contracts that define how two systems should interact with one other.
- APIs
   - Special types of interfaces that define how two computer systems interact with one another, coming in many forms, such as downloadable libraries and web APIs.
- **Web API**
   - Built to expose functionality over a network and used remotely by lots of different people, hiding the specific implementation or computational requirements needed for that functionality.
- Remote Procedure Call (RPC)
   - Calling a library function (or procedure) to be executed on another computer that is somewhere potentially far away (or remote).
   - The primary focus is on the actions being performed.
   - RPC-style APIs are great for stateless functionality, but they tend to be a much poorer fit when we introduce stateful API methods.
      - An API call is considered stateless when it can be made independently from all other API requests, with no additional context or data whatsover.
- **Resource-oriented APIs** are a way of designing APIs to reduce complexity by relying on a standard set of actions (methods) across a limited set of things (resources).
   - Special type of RPC-style APIs where each RPC follows a clear and standardized pattern: `<StandardMethod><Resource>()`:
      - `Create<Resource>()`
      - `Get<Resource>()`
      - `List<Resources>()`
      - `Delete<Resource>()`
      - `Update<Resource>()`
- Purpose of building an API:
   - We have some functionality that some users want.
   - Those users want to use this functionality programmatically.
- What makes an API "good":
   - **Operational** It must do the thing users actually want + nonoperational requirements (latency, accuracy).
   - **Expressive** It allows users to express the thing they want to do clearly and simply.
      - Hidden complication: API supports some functionality already, but due to an oversight on our part, we didn't realize that users wanted it and therefore didn't build an expressive way for users to access that functionality → workarounds, where users do unusual things to access hidden functionality.
   - **Simple** Rather than trying to excessively reduce the number of RPCs, APIs should aim to expose the functionality that users want in the most straightforward way possible, making the API as simple as possible, but no simpler.
      - Whenever you add something that might complicate an API for the benefit of an advanced user, it's best to keep this complication sufficiently hidden from a typical user only interested in the common case.
   - **Predictable** APIs that rely on repeated, predictable patterns (e.g., naming fields consistently) are easier and faster to learn and therefore better.
2. ### Introduction to API Design Patterns
- API design patterns are blueprints for ways of designing and structuring APIs.
- In most cases, an API design pattern will focus on the interface exclusively, without necessarily building out the implementation.
- API design patterns are important because APIs are generally very "rigid" and therefore not easy to change, so design patterns help minimize the need for large structural changes.
- API design patterns will have several sections:
   - Name and synopsis
   - Motivation
      - Detailed problem statement in the form of a user-focused objective.
      - What users want to accomplish.
      - Explore the edge cases that are likely to arise in the normal course of actual implementation.
      - Explore how the system should react in failure scenarios.
   - Overview**:** explaining what the design pattern recommends as a solution to the problem space.
      - Problem definition + list of solution requirements → General outline of a solution
      - Well-defined problem but not a single obvious solution → several different options that may each have their own trade-offs.
   - Implementation: interface definitions defined as code, which explain what an API using this pattern to solve a problem would look like.
      - structure + list of fields + detail discussion (behaviour of the structures and interaction between different fields...)
      - example API definition, with comments explaining what an API that correctly implements this pattern should look like.
   - Trade-offs: discuss what it takes away.
      - It's very important to understand what sacrifices are necessary in order to achieve the benefits that come from relying on a design pattern (functional limitations, increased complexity, ...)

## Part 2 Design principles

3. ### Naming
4. ### Resource scope and hierarchy
5. ### Data types and defaults

## Part 3 Fundamentals

6. ### Resource identification
7. ### Standard methods
8. ### Partial updates and retrievals
9. ### Custom methods
10. ### Long-running operations
11. ### Rerunnable jobs

## Part 4 Resource relationships

12. ### Singleton sub-resources
13. ### Cross references
14. ### Association resources
15. ### Add and remove custom methods
16. ### Polymorphism

## Part 5 Collective operations

17. ### Copy and move
18. ### Batch operations
19. ### Criteria-based deletion
20. ### Anonymous writes
21. ### Pagination
22. ### Filtering
23. ### Importing and exporting

## Part 6 Safety and security

24. ### Versioning and compatibility
25. ### Soft deletion
26. ### Request deduplication
27. ### Request validation
28. ### Resource revisions
29. ### Request retrial
30. ### Request authentication

