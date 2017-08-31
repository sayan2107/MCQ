package com.quiz.others;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class rand{
    
    public ArrayList<Integer> getRand(int range) throws Error, Exception{
        Integer[] arr = new Integer[range];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = i;
        }
        Collections.shuffle(Arrays.asList(arr));
        //converting Integer[] to int[]
        int[] arr1 = Arrays.stream(arr).mapToInt(Integer::intValue).toArray();
        ArrayList<Integer> arrList = new ArrayList<>();
            for (int index = 0; index < arr1.length; index++)
            {
                arrList.add(arr1[index]);
            }
            
        return(arrList);
    }
    
   
//    public static void main(String[] args) {
//        rand r=new rand();
//        ArrayList<Integer> arr=r.rand(8);
//        System.out.println(arr.get(0));
//        arr.remove(0);
//        System.out.println(arr);
//    }
}
