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
        @display("i=block/network2;bgb=1123,512");
    submodules:
        inbound: Source {
            @display("i=block/arrival;p=34,158");
            @display("p=37,121");
        }
        inboundRouter: Router {
            @display("p=137,157");
        }
        runway13L: Queue {
            @display("p=244,210");
        }
        runway4R: Queue {
            @display("p=253,97");
        }
        terminalRouter: Router {
            @display("p=361,163");
        }
        terminal1: Queue {
            @display("p=498,33");
        }
        terminal4: Queue {
            @display("p=499,102");
        }
        terminal5: Queue {
            @display("p=501,164");
        }
        terminal7: Queue {
            @display("p=499,235");
        }
        terminal8: Queue {
            @display("p=500,307");
        }
        runway13R: Queue {
            @display("p=788,283");
        }
        runway4L: Queue {
            @display("p=788,49");
        }
        outboundRouter: Router {
            @display("p=690,203");
        }
        outbound: MySinkExt {
            @display("i=block/departure;p=1005,165");
        }


    connections:
        inbound.out --> inboundRouter.in++;
        inboundRouter.out++ --> runway13L.in++;
        inboundRouter.out++ --> runway4R.in++;
        runway13L.out --> terminalRouter.in++;
        runway4R.out --> terminalRouter.in++;
        terminalRouter.out++ --> terminal1.in++;
        terminalRouter.out++ --> terminal4.in++;
        terminalRouter.out++ --> terminal5.in++;
        terminalRouter.out++ --> terminal7.in++;
        terminalRouter.out++ --> terminal8.in++;
        terminal1.out --> outboundRouter.in++;
        terminal4.out --> outboundRouter.in++;
        terminal5.out --> outboundRouter.in++;
        terminal7.out --> outboundRouter.in++;
        terminal8.out --> outboundRouter.in++;
        outboundRouter.out++ --> runway13R.in++;
        outboundRouter.out++ --> runway4L.in++;
        runway13R.out --> outbound.in++;
        runway4L.out --> outbound.in++;
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
