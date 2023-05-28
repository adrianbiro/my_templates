```JQL
assignee in (currentUser()) ORDER BY priority DESC, updated DESC
status not in (Closed, Deployed, Done, Released)  AND  assignee in (currentUser()) ORDER BY summary ASC, priority DESC, updated DESC
```