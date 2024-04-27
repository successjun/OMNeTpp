//Nicole McDermott
//I pledge my Honor that I have abided by the Stevens Honor System
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Delay;

network MM1
{
    parameters:
        @display("i=block/network2");
    submodules:
        sink: Sink {
            @display("p=308,110");
        }
        queue1: Queue {
            @display("p=119,71");
        }
        queue2: Queue {
            @display("p=308,32");
        }
        source: Source {
            @display("p=46,71");
        }
        router: Router {
            @display("p=203,71");
        }

    connections:
        source.out --> queue1.in++;
        queue1.out --> router.in++;
        router.out++ --> sink.in++;
        router.out++ --> queue2.in++;
        queue2.out --> sink.in++;

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
