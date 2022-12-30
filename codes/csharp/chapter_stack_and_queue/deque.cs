public class DLinkNumbers
{
        public int value;
        public DLinkNumbers front;
        public DLinkNumbers rear;
}

public class Deque
{
    private static DLinkNumbers head, end;
    private static int length;
    
    public int Empty()
    {
        return length;
    }
    
    public int EnHead(int value)
    {
        DLinkNumbers temp = new DLinkNumbers { value = value };
        if (head == null)
        {
            end = temp;
            head = temp;
        }
        else
        {
            temp.front = head;
            head.rear = temp;
            head = temp;
        }
        length += 1;
        return 1;
    }
    
    public int OutHead()
    {
        if (length == 0)
            return -1;
        int number = head.value;
        head = head.front;
        length -= 1;
        return number;
    }
    
    public int EnEnd(int value)
    {
        DLinkNumbers temp = new DLinkNumbers { value = value };
        if (end == null)
        {
            end = temp;
            head = temp;
        }
        else
        {
            temp.front = end;
            end.rear = temp;
            end = temp;
        }
        length += 1;
        return 1;
    }
    
    public int OutEnd()
    {
        if (length == 0)
            return -1;
        int number = end.value;
        end = end.front;
        length -= 1;
        return number;
    }
}

class TestForDeque
{
    [Test]
    public void Do()
    {
        Deque de = new Deque();
        de.EnHead(12);
        de.EnHead(13);
        de.EnHead(14);
        de.OutEnd();
        de.OutEnd();
        de.OutEnd();
        de.OutEnd();
        de.OutEnd();
        de.EnEnd(12);
        de.EnEnd(13);
        de.EnEnd(14);
        de.OutHead();
        de.OutHead();
        de.OutHead();
    }
}