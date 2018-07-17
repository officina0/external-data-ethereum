const ListenableContract = artifacts.require('./ListenableContract.sol');
const ListenableDemo = artifacts.require('./ListenableDemo.sol');
const chai = require('chai');
const assert = chai.assert;

describe.only("Listen  for external events", function () {
    it("Listen an event and increment counter", function (done) {
        var emitter = web3.eth.accounts[1];

        ListenableContract.deployed().then(listenable => {
            listenable.ListenEvent().watch((err, response) => { 
                //we listen on event emitted by ListeanableDemo
                //console.log(response);
                var originalMessage = response.args.message;
                var emitter = response.args.emitter;

                ListenableDemo.deployed().then(demo => { 
                    assert.equal(emitter,demo.address);
                    listenable.callBack(demo.address,originalMessage+" after some works").then(() => {
                        demo.getLastMessage().then(res => {
                            assert.equal(res,originalMessage+" after some works");
                            done();
                        });
                    });

                   
                })
                

            });
        });

        ListenableDemo.deployed().then(demo => {
            demo.listened("this is a listened call").then(resp => {
                    console.log("Emitted mesage on ListenableDemo");
                },
                err => {
                    console.log(err)
                })
                .catch(function(reason) {
                    console.log(reason)
                 })

        });

    })
});