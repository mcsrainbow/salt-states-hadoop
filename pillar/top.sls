base:
  '*':
    - users.lists
    - hadoop.params
  
  'demoenv-node-1':
    - hosts.node1.params

  'demoenv-node-2':
    - hosts.node2.params

  'demoenv-node-3':
    - hosts.node3.params
