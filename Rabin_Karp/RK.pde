

class RK
{
    
    // char[] alphabet;                                            // Usable alphabets
    String alphabetString;                                         // Index reference
    // int[] scores = {1,2,3,4};                                   // Matching scores
    int prime;                                                     // Prime number

    int[] hashVals;                                                // hash values
    int index;                                                     // hash values
    
     RK(String txt, String wd)
    {
        this(txt, wd, 4);
    }
    
    /**
     * @param     txt         long text need to be seaerch through
     *            wd          word to look for
     *            numOfAlph   the number of Alph exist in txt and wd (counting from `a`)
     */
    RK(String txt, String wd, int numOfAlph)
    {
        alphabetString = "";
        for(char i = 'a'; i < 'a' + numOfAlph; i++)
        {
            alphabetString += char(i);
        }
        prime = numOfAlph;
        hashVals = new int[txt.length() - wd.length() + 1];
        index = rk(txt, wd);
    }
    
    private int getHash(String txt, int index, int exp) {
        int hash = 0;
        char letter = txt.charAt(index);
        hash += scores[alphabetString.indexOf(letter)] * pow(prime, exp);
        return hash;
    }

    private int rk(String txt, String wd) {
        // Get information of the word that we are searching for 
        int wdHash = 0; 
        int wdLen = wd.length();
        for (int i = 0; i < wd.length(); i++) {
            wdHash += getHash(wd, i, i);
        }

        // Get information of the document that we are searching in 
        int txtLen = txt.length(); 
        int txtHash = 0; 

        // get first hash
        for (int i = 0; i < wdLen; i++) {
            txtHash += getHash(txt, i, i);
        }
        
        hashVals[0] = txtHash;

        // rolling hash
        for (int i = wdLen; i < txtLen; i++) {
            
            if (wdHash == txtHash) {
                return i - wdLen;
            } else {
                int newHash = getHash(txt, i, wdLen - 1);
                int oldHash = getHash(txt, (i - wdLen), 0);
                txtHash = (txtHash - oldHash)/prime + newHash;
            }
            hashVals[i - wdLen + 1] = txtHash;
        }
        if (wdHash == txtHash) {
            return txtLen - wdLen;
        }
        return -1;
    }
}
