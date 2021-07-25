# The Earth Project

## As an experimental platform
This project is testing a new concept of cryptcurrency.


## Forked from the master branch of the Monero project
commit 5f5a51a6c81a50c67bf7c512d548018ff4bf2e58
Author: moneromooo-monero <moneromooo-monero@users.noreply.github.com>
xDate:   Mon Jan 8 10:57:34 2018 +0000



## Points we modified
1. Changed names in codes and src/version.cpp.in
2. Disabled update check
3. Disabled hardcoded checkpoints (src/checkpoints/checkpoints.cpp) and version checks (src/cryptonote_core/blockchain.cpp)
4. Added some new docker for ubuntu16 (in utils/build_scripts/ubuntu16.*)
5. Disabled PER_BLOCK_CHECKPOINT in CMakeList.txt


## Issues we observe

* Connection problem? Protocol error? Even in the original Monero protocol, it occurs.
2018-01-29 13:35:13.807	[P2P5]	INFO	net	src/p2p/net_node.inl:1716	[10.10.0.5:18080 46adbe26-0193-b73e-7067-dfdaa8ca6a8e OUT] NEW CONNECTION
2018-01-29 13:35:13.808	[P2P5]	INFO 	net	contrib/epee/include/storages/levin_abstract_invoke2.h:125			      Failed to invoke command 1007 return code -3
2018-01-29 13:35:13.808	[P2P5]	WARN 	net	src/p2p/net_node.inl:1560							      [10.10.0.5:18080 OUT] COMMAND_REQUEST_SUPPORT_FLAGS invoke failed. (-3, LEVIN_ERROR_CONNECTION_DESTROYED)


## TODO
* Change Blockchain Genesis
* Need to test
* Play it
