// Nicole McDermott
// I pledge my Honor that I have abided by the Stevens Honor System

import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.Server;

network PQ
{
    parameters:
        @display("i=block/network2");
    submodules:
        sink: Sink {
            @display("p=341,89");
        }
        passiveQueue1: PassiveQueue {
            @display("p=192,50");
        }
        passiveQueue2: PassiveQueue {
            @display("p=192,128");
        }
        source1: Source {
            @display("p=50,50");
        }
        source2: Source {
            @display("p=50,128");
        }
        classifier: Classifier {
            @display("p=116,89");
        }
        server: Server {
            @display("p=264,89");
        }

    connections:
        source1.out --> classifier.in++;
        source2.out --> classifier.in++;
        classifier.out++ --> passiveQueue1.in++;
        classifier.rest --> passiveQueue2.in++;
        passiveQueue1.out++ --> server.in++;
        passiveQueue2.out++ --> server.in++;
        server.out --> sink.in++;
}

simple Classifier
{
    parameters:
        @group(Queueing);
        @display("i=block/classifier");
        string dispatchField @enum("type","priority") = default("type");
    gates:
        input in[];
        output out[];
        output rest; // Messages that weren't classified
}

simple PassiveQueue
{
    parameters:
        @group(Queueing);
        @signal[dropped](type="long");
        @signal[queueLength](type="long");
        @signal[queueingTime](type="simtime_t");
        @statistic[dropped](title="drop event"; record=vector?,count; interpolationmode=none);
        @statistic[queueLength](title="queue length"; record=vector?,timeavg,max; interpolationmode=sample-hold);
        @statistic[queueingTime](title="queueing time at dequeue"; record=vector?,mean,max; unit=s; interpolationmode=mode);
        @display("i=block/passiveq;q=queue");
        int capacity = default(-1); //negative capacity means unlimited queue
        bool fifo = default(true); //whether the module works as a queue (fifo=true) or a stack (fifo =false)
    gates:
        input in[];
        output out;
}

simple Server
{
    parameters:
        @group(Queueing);
        @display("i=block/server");
        @signal[busy](type="bool");
        @statistic[busy](title="server busy state"; record=vector?,timeavg; interpolationmode=same-hold);
        string fetchingAlgorithm @enum("priority","random","roundRobin","longestQueue") = default("priority"); //how the next job will be chosen from attached queues
        volatile double serviceTime @unit(s); //service tiem of a job
    gates:
        input in[];
        output out;
}
