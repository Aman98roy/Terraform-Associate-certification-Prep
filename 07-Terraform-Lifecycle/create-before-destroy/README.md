## lifecyle - create_before_destroy
- Default Behavior of a Resource: Destroy Resource & re-create Resource
- With Lifecycle Block we can change that using `create_before_destroy=true`
  - First new resource will get created
  - Second old resource will get destroyed
- **Add Lifecycle Block inside Resource Block to alter behavior**  
```t
# Lifecycle Block inside a Resource
  lifecycle {
    create_before_destroy = true
  }
```  