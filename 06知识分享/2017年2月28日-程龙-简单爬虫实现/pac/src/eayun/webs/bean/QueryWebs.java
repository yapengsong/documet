package eayun.webs.bean;

import java.util.LinkedList;

public class QueryWebs {
	//使用链表实现队列
	private LinkedList queue=new LinkedList<>();
	
	
	//入队列
	public void addQueue(Object t){
		queue.add(t);
	}
	//出队列
	public Object deQueue(){
		return queue.removeFirst();
	}
	
	
	//判断队列是否为空
	public boolean isQueueEmpty(){
		return queue.isEmpty();
	}
	
	//判断队列是否包含t
	public boolean contians(Object t){
		return queue.contains(t);
	}

	
	public boolean empty(){
		return queue.isEmpty();
	}
}
