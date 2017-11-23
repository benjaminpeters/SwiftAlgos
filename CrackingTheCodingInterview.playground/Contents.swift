import Foundation

/*
 Alice is taking a cryptography class and finding anagrams to be very useful. We consider two strings to be anagrams of each other if the first string's letters can be rearranged to form the second string. In other words, both strings must contain the same exact letters in the same exact frequency For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.
 
 Alice decides on an encryption scheme involving two large strings where encryption is dependent on the minimum number of character deletions required to make the two strings anagrams. Can you help her find this number?
 
 Given two strings,  and , that may or may not be of the same length, determine the minimum number of character deletions required to make  and  anagrams. Any characters can be deleted from either of the strings.
 
 Input Format
 
 The first line contains a single string, .
 The second line contains a single string, .
 
 Constraints
 
 It is guaranteed that  and  consist of lowercase English alphabetic letters (i.e.,  through ).
 */

func makeAnagram(_ fl:String, _ sl:String) {
    var count: Int = 0
    var finalHash: [Character : Int] = [:]
    
    for i in fl.characters {
        if finalHash[i] == nil {
            finalHash[i] = 1
        }
        else {
            finalHash[i]! += 1
        }
    }
    
    for i in sl.characters {
        if finalHash[i] == nil {
            finalHash[i] = -1
        }
        else {
            finalHash[i]! -= 1
        }
    }
    
    for (_,y) in finalHash {
        count += abs(y)
    }
    
    print(count)
}

var firstLine = "imkhnpqnhlvaxlmrsskbyyrhwfvgteubrelgubvdmrdmesfxkpykprunzpustowmvhupkqsyjxmnptkcilmzcinbzjwvxshubeln"
var secondLine = "wfnfdassvfugqjfuruwrdumdmvxpbjcxorettxmpcivurcolxmeagsdundjronoehtyaskpwumqmpgzmtdmbvsykxhblxspgnpgfzydukvizbhlwmaajuytrhxeepvmcltjmroibjsdkbqjnqjwmhsfopjvehhiuctgthrxqjaclqnyjwxxfpdueorkvaspdnywupvmy"

//makeAnagram(firstLine, secondLine)


/*
 A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.
 
 Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.
 
 Input Format
 
 The first line contains two space-separated integers describing the respective values of  (the number of words in the magazine) and  (the number of words in the ransom note).
 The second line contains  space-separated strings denoting the words present in the magazine.
 The third line contains  space-separated strings denoting the words present in the ransom note.
 
 Constraints
 
 .
 Each word consists of English alphabetic letters (i.e.,  to  and  to ).
 The words in the note and magazine are case-sensitive.
 Output Format
 
 Print Yes if he can use the magazine to create an untraceable replica of his ransom note; otherwise, print No.
 */

func ransomNote(_ magazineWords: [String], _ nodeWords: [String]) -> String {
    var magaHash: [String : Int] = [:]
    
    for i in magazineWords {
        if magaHash[i] == nil {
            magaHash[i] = 1
        }
        else {
            magaHash[i]! += 1
        }
    }
    
    for i in nodeWords {
        if magaHash[i] != nil && magaHash[i]! > 0{
            magaHash[i]! -= 1
            continue
        }
        else{
            return "No"
        }
    }
    return "Yes"
}

//let wordLengths = readLine()

let magazine = "give me one grand today night".components(separatedBy: " ")
let note = "give one grand today".components(separatedBy: " ")

//ransomNote(magazine, note)

/*
 A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].
 
 Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().
 
 A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
 
 By this logic, we say a sequence of brackets is considered to be balanced if the following conditions are met:
 
 It contains no unmatched brackets.
 The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, print YES on a new line; otherwise, print NO on a new line.
 
 Input Format
 
 The first line contains a single integer, , denoting the number of strings.
 Each line  of the  subsequent lines consists of a single string, , denoting a sequence of brackets.
 
 Constraints
 
 , where  is the length of the sequence.
 Each character in the sequence will be a bracket (i.e., {, }, (, ), [, and ]).
 Output Format
 
 For each string, print whether or not the string of brackets is balanced on a new line. If the brackets are balanced, print YES; otherwise, print NO.
 */

func balancedBrackets(_ bracket: String) -> String{
    let charArr = (bracket.characters.map { String($0) })
    
    var halfPoint = charArr.count / 2
    
    var firstHalf = charArr[0..<halfPoint]
    var secondHalf = charArr[halfPoint..<charArr.count]

    while halfPoint > 0{
        let val = firstHalf.popLast()!
        
        switch val{
        case "(":
            if secondHalf.popFirst()! != ")" { return "NO" }
        case "[":
            if secondHalf.popFirst()! != "]" { return "NO" }
        case "{":
            if secondHalf.popFirst()! != "}" { return "NO" }
        default:
            break
        }
        halfPoint -= 1
        

    }
    return "YES"
}
var numOfStr: Int = 3
//
//balancedBrackets("{[()]}")
//balancedBrackets("{[(])}")
//balancedBrackets("{{[[(())]]}}")
balancedBrackets("}][}}(}][))]")
balancedBrackets("[](){()}")
balancedBrackets("()")
balancedBrackets("({}([][]))[]()")
balancedBrackets("{)[](}]}]}))}(())(")


