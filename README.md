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
