const Uranium42 = artifacts.require("Uranium42");

module.exports = function (deployer) {
  deployer.deploy(Uranium42, 1000);
};