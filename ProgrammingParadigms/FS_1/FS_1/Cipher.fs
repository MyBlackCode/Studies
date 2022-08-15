module Cipher

let alphabetLength = 26
type SimpleCipher(key: string) =
        let privatekey = key.ToLower()
    
        member __.Key with get() =
                privatekey
    
        member __.Encode(plaintext) =
                plaintext |> String.mapi (fun i c -> (int c + (int privatekey.[i % privatekey.Length] - int 'a') - int 'a' ) % alphabetLength + int 'a' |> char)
    
        member __.Decode(ciphertext) = 
                ciphertext |> String.mapi (fun i c -> (int c - (int privatekey.[i % privatekey.Length] - int 'a') - int 'z') % alphabetLength + int 'z' |> char)
    
        new() =
            let rnd = System.Random()
            let newkey = String.replicate alphabetLength "a" |> String.map (fun e -> char (rnd.Next(int 'a',int 'z' + 1)))
            SimpleCipher(newkey)