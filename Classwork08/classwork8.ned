//Nicole McDermott
//I pledge my Honor that I have abided by the Stevens Honor System

simple Node3
{
    parameters:
        @display("i=block/routing");
        int num_msgs = 10;
    gates:
        input in;
        output out;
}

network Classwork8
{
    @display("bgb=342,184");
    types:
        channel C extends ned.DelayChannel{
        delay = 100ms;
        }
    submodules:
        node1: Node3 {
            parameters:
                @display("i=,green;p=38,69");
        }
        node2: Node3 {
            parameters:
                @display("i=,pink;p=154,69");
        }
        node3: Node3 {
            parameters:
                @display("i-=orange;p=240,117");
        }
    connections:
        node1.out --> C --> node2.in;
        node2.out --> C --> node3.in;
        node3.out --> C --> node1.in;

}
