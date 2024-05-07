import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Delay;


network JFK
{
    parameters:
        @display("i=block/network2");
    submodules:
        inbound: Source {
            @display("i=block/arrival;p=51,160");
            @display("p=37,121");
        }
        terminalRouter: Router {
            @display("p=142,160");
        }
        terminal1: Queue {
            @display("p=228,32");
        }
        terminal4: Queue {
            @display("p=228,95");
        }
        terminal5: Queue {
            @display("p=228,160");
        }
        terminal7: Queue {
            @display("p=228,226");
        }
        terminal8: Queue {
            @display("p=228,297");
        }
        runway1: Queue {
            @display("p=471,32");
        }
        runway2: Queue {
            @display("p=471,95");
        }
        runway3: Queue {
            @display("p=471,160");
        }
        runway4: Queue {
            @display("p=471,226");
        }
        runwayRouter: Router {
            @display("p=360,151");
        }
        outbound: MySinkExt {
            @display("i=block/departure;p=604,160");
            @display("p=587,121");
        }


    connections:
        inbound.out --> terminalRouter.in++;
        terminalRouter.out++ --> terminal1.in++;
        terminalRouter.out++ --> terminal4.in++;
        terminalRouter.out++ --> terminal5.in++;
        terminalRouter.out++ --> terminal7.in++;
        terminalRouter.out++ --> terminal8.in++;
        terminal1.out --> runwayRouter.in++;
        terminal4.out --> runwayRouter.in++;
        terminal5.out --> runwayRouter.in++;
        terminal7.out --> runwayRouter.in++;
        terminal8.out --> runwayRouter.in++;
        runwayRouter.out++ --> runway1.in++;
        runwayRouter.out++ --> runway2.in++;
        runwayRouter.out++ --> runway3.in++;
        runwayRouter.out++ --> runway4.in++;
        runway1.out --> outbound.in++;
        runway2.out --> outbound.in++;
        runway3.out --> outbound.in++;
        runway4.out --> outbound.in++;
}

simple Router
{
    parameters:
        @group(Queueing);
        @display("i=block/routing");
        string routingAlgorithm @enum("random","roundRobin","shortestQueue","minDelay") = default("random");
        volatile int randomGateIndex = default(intuniform(0,sizeof(out)-1)); //the destination gate in case of random routing
    gates:
        input in[];
        output out[];
}

simple MySinkExt extends Sink
{
    @class(MySinkExt);
}
