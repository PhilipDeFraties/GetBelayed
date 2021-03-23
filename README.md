# Queries

Fetch all users:

``` 
{ 
    users {
            id
            firstName
            lastName
            email
            gender
        }
}
```

Fetch single user by id:

```
{
  user(id: 1) {
    id
    firstName
    lastName
    email
    gender
  }
}
```

Create User:

```
mutation {
  createUser(input: {
    firstName: "Phil",
    lastName: "DeFraties",
    email: "fake@email.com"
  }) {
    user {
      id
      firstName
      lastName
      email
    }
    errors
  }
}
```
