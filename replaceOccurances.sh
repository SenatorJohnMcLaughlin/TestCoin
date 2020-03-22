find ./ -type f -readable -writable -exec sed -i "s/testcoin/testcoin/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/Testcoin/Testcoin/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/TestCoin/TestCoin/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/TESTCOIN/TESTCOIN/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/testcoind/testcoind/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/TTC/TTC/g" {} ";"
find ./ -type f -readable -writable -exec sed -i "s/ttc/ttc/g" {} ";"

