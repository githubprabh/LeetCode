class Solution {
    public int removeElement(int[] nums, int val) {
        int[] a = nums;
        int[] b = nums;
        
        int j =0;
        for(int i =0; i<b.length ; i++){
            if(b[i] != val){
                a[j] = b[i];
                j++;
            }
        }
        nums = a;
        return j;
    }
}
