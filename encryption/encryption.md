## 本的单向加密算法
### BASE64
> 严格地说，属于编码格式，而非加密算法
**算法**
1. 把3个字符变成4个字符。
2. 每76个字符加一个换行符。
3. 最后的结束符也要处理。

### MD5(Message Digest algorithm 5，信息摘要算法)


### SHA(Secure Hash Algorithm，安全散列算法)

### HMAC(Hash Message Authentication Code，散列消息鉴别码)

## 复杂的对称加密（DES、PBE）、非对称加密算法
### DES(Data Encryption Standard，数据加密算法)/AES
### PBE(Password-based encryption，基于密码验证)

### RSA(算法的名字以发明者的名字命名：Ron Rivest, AdiShamir 和Leonard Adleman)
**流程**
* 甲方构建密钥对儿，将公钥公布给乙方，将私钥保留。
* 甲方使用私钥加密数据，然后用私钥对加密后的数据签名，发送给乙方签名以及加密后的数据；乙方使用公钥、签名来验证待解密数据是否有效，如果有效使用公钥对数据解密。
* 乙方使用公钥加密数据，向甲方发送经过加密后的数据；甲方获得加密数据，通过私钥解密。
### DH(Diffie-Hellman算法，密钥一致协议)
### DSA(Digital Signature Algorithm，数字签名)
> 不单单只有公钥、私钥，还有数字签名。私钥加密生成数字签名，公钥验证数据及签名。
### ECC(Elliptic Curves Cryptography，椭圆曲线密码编码学)


## 参考资料
[http://snowolf.iteye.com/blog/379860](http://snowolf.iteye.com/blog/379860)

