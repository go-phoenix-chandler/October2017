#!/bin/bash

# Create container
docker run -it -p 8080:8080 -p 9080:9080 -d dgraph/dgraph:v0.8.2 dgraph --bindall=true --memory_mb 2048

# Init Data
curl http://localhost:8080/query -XPOST -d $'
mutation {
  schema {
    name: string @index(exact, term) .
    skill: uid @reverse @count .
    type: string @index(exact) .
    name: string @index(exact, term) .
    desc: string .
    tag: uid @reverse @count .
  }
  set {
    _:javascript <name> "javascript" .
    _:javascript <type> "skill" .

    _:sql <name> "sql" .
    _:sql <type> "skill".
    
    _:go <name> "go" .
    _:go <type> "skill".
    
    _:ruby <name> "ruby" .
    _:ruby <type> "skill".
    
    _:db <name> "db" .
    _:db <type> "skill".
    
    _:linux <name> "linux" .
    _:linux <type> "skill".
    
    _:architecture <name> "architecture" .
    _:architecture <type> "skill".
    
    _:php <name> "php" .
    _:php <type> "skill".
    
    _:mongo <name> "mongo" .
    _:mongo <type> "skill".
    
    _:windows <name> "windows" .
    _:windows <type> "skill".
    
    _:networking <name> "networking" .
    _:networking <type> "skill".
    
    _:docker <name> "docker" .
    _:docker <type> "skill".
    
    _:kubernetes <name> "kubernetes" .
    _:kubernetes <type> "skill".
    
    _:aws <name> "aws" .
    _:aws <type> "skill".
    
    _:azure <name> "azure" .
    _:azure <type> "skill".
    
    _:first_ticket <name> "First Ticket" .
    _:first_ticket <desc> "This is the first ticket..." .
    _:first_ticket <type> "ticket" .
    _:first_ticket <tag> _:go .
    _:first_ticket <tag> _:db .
    _:first_ticket <tag> _:sql .
    
    _:second_ticket <name> "Second Ticket" .
    _:second_ticket <desc> "This is the second ticket..." .
    _:second_ticket <type> "ticket" .
    _:second_ticket <tag> _:javascript .
    _:second_ticket <tag> _:mongo .
    _:second_ticket <tag> _:linux .
 
    _:john <name> "john" .
    _:john <type> "user" .
    _:john <skill> _:sql .
    _:john <skill> _:javascript .
    _:john <skill> _:go .
    _:john <skill> _:ruby .
    _:john <skill> _:db .
    _:john <skill> _:linux .
    
    _:jeremy <name> "jeremy" .
    _:jeremy <type> "user" .
    _:jeremy <skill> _:architecture .
    _:jeremy <skill> _:php .
    _:jeremy <skill> _:go .
    _:jeremy <skill> _:mongo .
    _:jeremy <skill> _:windows .
    _:jeremy <skill> _:bash .
 
    _:thomas <name> "thomas" .
    _:thomas <type> "user" .
    _:thomas <skill> _:linux .
    _:thomas <skill> _:sql .
    _:thomas <skill> _:javascript .
    _:thomas <skill> _:windows .
    _:thomas <skill> _:db .
    _:thomas <skill> _:networking .
    
    _:chris <name> "chris" .
    _:chris <type> "user" .
    _:chris <skill> _:docker .
    _:chris <skill> _:kubernetes .
    _:chris <skill> _:aws .
    _:chris <skill> _:azure .
    _:chris <skill> _:architecture .
    
    _:alex <name> "alex" .
    _:alex <type> "user" .
    _:alex <skill> _:mongo .
    _:alex <skill> _:javascript .
    _:alex <skill> _:ruby .
    _:alex <skill> _:php .
  }
}
'  | python -m json.tool | less