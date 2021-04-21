const { expect, use, assert } = require("chai");
const {
  deployContract,
  MockProvider,
  BigNumber,
  solidity,
} = require("ethereum-waffle");
const BasicContract = require("../build/RunContract.json");

use(solidity);

describe("Greeter", function () {
  const provider = new MockProvider();
  const [wallet, walletTo] = new MockProvider().getWallets();

  let token;

  beforeEach(async () => {
    token = await deployContract(wallet, BasicContract, []);
  });

  it("Set new value", async () => {
    expect(await token.setInterface(2, 2));

    expect(await token.getInterface(2)).to.equal(2);
  });

  it("Get new value", async () => {
    await token.setInterface(2, 2);

    expect(await token.getInterface(2)).to.equal(2);
  });

  it(`Lenght and postion value`, async () => {
    await token.setInterface(2, 2);
    await token.setInterface(3, 4);

    expect(await token.lengthInterface()).to.equal(2);
    expect(await token.atInterface(0)).to.equal(2);
  });
});
