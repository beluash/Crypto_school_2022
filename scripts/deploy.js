const hre = require("hardhat");

async function main() {
  const Crypto_NFT = await hre.ethers.getContractFactory("Crypto_NFT");
  const nft = await Crypto_NFT.deploy();

  await nft.deployed();

  console.log("Crypto_NFT deployed to:", nft.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
