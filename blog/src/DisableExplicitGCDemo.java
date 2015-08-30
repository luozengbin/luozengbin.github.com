import java.nio.*;


public class DisableExplicitGCDemo {
    public static void main(String[] args) {
        for (int i = 0; i < 100000; i++) {
            ByteBuffer.allocateDirect(128);
        }
        System.out.println("Done");
    }
}
