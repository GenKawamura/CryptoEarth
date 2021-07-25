#!/bin/bash

cd $(dirname $0)
MYHOME=$(pwd)
if [ ! -e monero ]; then
    git clone https://github.com/monero-project/monero
    git reset --hard 5f5a51a6c81a50c67bf7c512d548018ff4bf2e58
fi
cd monero


## Remove .git
[ -e .git ] && rm -rf .git
cp -r $MYHOME/git_repo .git

## For Doxygen
cp -v $MYHOME/Doxyfile . 


## Change MONERO to EARTH
cp -v $MYHOME/README.md .

find src -type f | xargs -I {} sed -e "s/MONERO/EARTH/g" -i {}
find src -type f | xargs -I {} sed -e "s/monerod/earthd/g" -i {}
find tests -type f | xargs -I {} sed -e "s/MONERO/EARTH/g" -i {}

find src -type f | xargs -I {} sed -e "s/monero-blockchain/earth-blockchain/g" -i {}
find src -type f | xargs -I {} sed -e "s/monero-wallet/earth-wallet/g" -i {}
find src -type f | xargs -I {} sed -e "s/monero-gen/earth-gen/g" -i {}
find src -type f | xargs -I {} sed -e "s/\"Monero/\"Earth/g" -i {}
find src -type f | xargs -I {} sed -e "s/BitMonero/BlueEarth/g" -i {}

sed -e "s/bitmonero/earth/g" -i src/cryptonote_config.h


## Copy docker files
cp -v $MYHOME/Dockerfile .
cp -v $MYHOME/utils/build_scripts/* utils/build_scripts/


## Change CMake
sed -e "s/PER_BLOCK_CHECKPOINT 1/PER_BLOCK_CHECKPOINT 0/" -i CMakeLists.txt

## Change Version
sed -e "s/DEF_EARTH_VERSION \"0.*\"/DEF_EARTH_VERSION \"0.2.0.0-master\"/" -i src/version.cpp.in
sed -e "s/DEF_EARTH_RELEASE_NAME \".*\"/DEF_EARTH_RELEASE_NAME \"Blue Planet\"/" -i src/version.cpp.in


## Adding lunchbox
cp -r $MYHOME/lunchbox src



## Display memos to change codes by hand
echo "
* Change seed IPs ()
--> Replace the IP lists
372:
  template<class t_payload_net_handler>
  std::set<std::string> node_server<t_payload_net_handler>::get_seed_nodes(bool testnet) const
  {
    std::set<std::string> full_addrs;
    if (testnet)
    {
      full_addrs.insert(\"35.165.63.240:28080\");
      full_addrs.insert(\"10.10.0.5:28080\");
      full_addrs.insert(\"10.10.0.6:28080\");
      full_addrs.insert(\"10.10.0.7:28080\");
      full_addrs.insert(\"10.10.0.8:28080\");
      full_addrs.insert(\"10.10.0.9:28080\");
    }
    else
    {
      full_addrs.insert(\"35.165.63.240:18080\");
      full_addrs.insert(\"10.10.0.5:18080\");
      full_addrs.insert(\"10.10.0.6:18080\");
      full_addrs.insert(\"10.10.0.7:18080\");
      full_addrs.insert(\"10.10.0.8:18080\");
      full_addrs.insert(\"10.10.0.9:18080\");
    }



* Disable tools::check_updates (src/common/updates.cpp)
--> Add 
44: return false;

* Disable hardcoded checkpoints (src/checkpoints/checkpoints.cpp) 
--> Comment out
166: /*


* Disable blockchain hardfork checks (src/cryptonote_core/blockchain.cpp)

--> Comment out mainnet_hard_forks
91:  } mainnet_hard_forks[] = { /*
108:   { 6, 1400000, 0, 1503046577 }, */

--> Version 1 is till 0
112: //static const uint64_t mainnet_hard_fork_version_1_till = 1009826;
113: static const uint64_t mainnet_hard_fork_version_1_till = 0;


"

