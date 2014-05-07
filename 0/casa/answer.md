我的主要思路是通过hash表来找重复的值，通过这个思路来解决问题的关键点正如唐大伟所说，就在于如何能够有效剪枝。

1. 建立基础数据结构：
    ```

    typedef struct {
        node *previous,
        node *next,
        uint64 hash, //模长
        uint64 minusValue, //a-b的值
        uint64 a,
        uint64 b
    }node;

    ``` 
2. (a, b)数字对可以理解成一个二维数组,取二维数组的模长,用它来做hash, 放入node中，previous和next默认NULL.
3. 准备一个差不多长（看实际情况）的数组，根据hash计算出存放node的index，一般取余也就够了。

设置好初始值之后，就可以来走逻辑了，伪码如下

```
  hash表变量：hashArray
  
  for each (a, b)：
  	node = generateNode(a, b)
  	index = generateIndex(node.hash)
  	hashArrayItem = hashArray[index]
  	
  	if hashArrayItem == NULL:
  		insert hashArrayItem
  	else:
  		if hashArrayItem is equal to node:
  			save node to duplicate node array
  		else:
  			if first bit of minusValue > 0:
  				while (true):
  					hashArrayItem = hashArrayItem.previous
  					if hashArrayItem == NULL:
  						break;
  					if hashArrayItem is equal to node
  						save node to duplicate node array
  				end while
  			else:
  				while (true):
  					hashArrayItem = hashArrayItem.next
  					if hashArrayItem == NULL:
  						break;
  					if hashArrayItem is equal to node
  						save node to duplicate node array
  				end while
  	
  end for
  
  
  剪枝策略就是根据minusValue先去掉一部分不用check的node，如果重复项密度比较小，在确定是否为同一个node的时候，可以更进一步地先比较minus，再逐步比较a,b
  
  这个问题的实际场景是这样的：
  	在我们的聊天服务中，区分每个客户端是否相同可能有多个关注点，比如设备号，用户ID等。当一个用户在另外一个地方登录的时候，如何能够快速找到相同的那个链接并把它断掉，就是这个问题的实际场景，实际中出现的关注点可能不止两个，会有多个，形成多维数组，如果不用好一点的办法，要踢掉别人可能就要花很长时间。
```

以上只是我个人的解决思路，如果大家有更好的也可以提PR进来。
