/**
 * TestHeap.java
 * CIS121-204 Lab 8 Supplement
 * @author Chinawat Isradisaikul
 * @version 1: 11/05/2007
 */
import static org.junit.Assert.*;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestHeap {
	private static BinaryMinHeapI<Integer> heap;
	private static final int N=10;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		heap=new BinaryMinHeap<Integer>();
	}

	@Test
	public void testAdd() {
		assertTrue(heap.isEmpty());
		heap.add(N);
		for(int i=N-1;i>0;i--)
		{
			assertFalse(heap.isEmpty());
			heap.add(i);
		}
	}

	@Test
	public void testRemoveRoot() {
		for(int i=1;i<=N;i++)
		{
			assertFalse(heap.isEmpty());
			assertEquals(i,heap.removeRoot());
		}
		assertTrue(heap.isEmpty());
	}

	@Test
	public void testHeap()
	{
		assertTrue(heap.isEmpty());
		heap.add(0);
		assertEquals(0,heap.removeRoot());
	}
}
