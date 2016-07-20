package main

import (
    "fmt"
)

type Node struct {
    Payload int
    Next* Node
}

type List struct{
    Head* Node
}


func main(){
    list := List{nil}
    list.Add(1)
    list.Add(2)
    fmt.Printf("\n pay is %d \n", list.Head.Next.Payload)
}

func (list* List) Add(num int){
    if  list.Head == nil{
        list.Head = &Node{num,nil}
    } else {
        var i* Node = list.Head
        for  i.Next != nil {
            i = i.Next
        }
        i.Next = &Node{num,nil}
    }
}
