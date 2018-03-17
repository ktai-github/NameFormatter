// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

class NameFormatter {
  
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  func inverted() -> String {
//return empty string
    if name == "" {
      return ""
//      if name contains space character anywhere
    } else if let _ = name.rangeOfCharacter(from: .whitespaces) {
      
      if name.hasPrefix(" ")  {
//        remove space at beginning and end of the name
        let nameNoWhiteSpacePrefixSuffix = name.trimmingCharacters(in: .whitespaces)
        var drCharSet: CharacterSet
        var honorific = ""
        
//        if name has honorific at the beginning
        if nameNoWhiteSpacePrefixSuffix.hasPrefix("Dr. ") ||
          nameNoWhiteSpacePrefixSuffix.hasPrefix("Mr. ") ||
          nameNoWhiteSpacePrefixSuffix.hasPrefix("Mrs. ") ||
          nameNoWhiteSpacePrefixSuffix.hasPrefix("Ms. ") {
          switch nameNoWhiteSpacePrefixSuffix.prefix(3) {
          case "Dr.":
            drCharSet = CharacterSet(charactersIn: "Dr. ")
            honorific = "Dr. "
          case "Mr.":
            drCharSet = CharacterSet(charactersIn: "Mr. ")
            honorific = "Mr. "
          case "Mrs":
            drCharSet = CharacterSet(charactersIn: "Mrs. ")
            honorific = "Mrs. "
          default:
            drCharSet = CharacterSet(charactersIn: "Ms. ")
            honorific = "Ms. "
          
          }
          
//          remove honorific to split first and last name
          let nameNoPrefix = name.trimmingCharacters(in: drCharSet)
          
//          if name contains space after honorific and first name
          if nameNoPrefix.contains(" ") {
            let split = nameNoPrefix.split(separator: " ")
            let last = String(split.suffix(1).joined(separator: [" "]))
            let first = String(split.prefix(1).joined(separator: [" "]))
            return "\(honorific)\(last), \(first)"
          }
        }
        
//        let range = name.rangeOfCharacter(from: .whitespaces)

        //      split first and last names
        if nameNoWhiteSpacePrefixSuffix.contains(" ") {
          let split = name.split(separator: " ")
          let last = String(split.suffix(1).joined(separator: [" "]))
          let first = String(split.prefix(1).joined(separator: [" "]))
          return "\(last), \(first)"

        } else {
          return nameNoWhiteSpacePrefixSuffix
        }
        
//      contains honorific
      } else if name.contains(". ") {
        var drCharSet: CharacterSet
        var honorific = ""
        
//        if contains honorific only, return empty string
        if name.hasSuffix(". "){
          return ""
          
//          if honorific is at beginning
        } else if name.hasPrefix("Dr. ") ||
          name.hasPrefix("Mr. ") ||
          name.hasPrefix("Mrs. ") ||
          name.hasPrefix("Ms. ") {
          switch name.prefix(3) {
          case "Dr.":
            drCharSet = CharacterSet(charactersIn: "Dr. ")
            honorific = "Dr. "
          case "Mr.":
            drCharSet = CharacterSet(charactersIn: "Mr. ")
            honorific = "Mr. "
          case "Mrs":
            drCharSet = CharacterSet(charactersIn: "Mrs. ")
            honorific = "Mrs. "
          default:
            drCharSet = CharacterSet(charactersIn: "Ms. ")
            honorific = "Ms. "
            
          }
          
//          remove honorific for separating first and last names
          let nameNoPrefix = name.trimmingCharacters(in: drCharSet)
          
          //          if name contains space after honorific and first name
          if nameNoPrefix.contains(" ") {
            let split = nameNoPrefix.split(separator: " ")
            let last = String(split.suffix(1).joined(separator: [" "]))
            let first = String(split.prefix(1).joined(separator: [" "]))
            return "\(honorific)\(last), \(first)"
          }
          
        } else {
//          return just one honorific name
          return name
        }
      } else {
//        separate first and last name
        let split = name.split(separator: " ")
        let last = String(split.suffix(1).joined(separator: [" "]))
        let first = String(split.prefix(1).joined(separator: [" "]))
        return "\(last), \(first)"
      }
    }
//    return just one name
    return name
  }
  
}

