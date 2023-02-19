#greatest common divisor (GCD) Euclidean algorithm
def gcd(a, b)
  if b == 0
    return a
  end
  return gcd(b, a % b)
end

#prime numbers
print "P: "
p = gets.chomp.to_i

print "Q: "
q = gets.chomp.to_i

#modulus for the public and private keys
n = p * q

#calculate the n
phi = (p - 1) * (q - 1)

#potential public keys
public_keys = []
(2...phi).each do |i|
  if gcd(i, phi) == 1 && gcd(i, n) == 1
    public_keys << i
  end
  break if public_keys.size >= 100
end

e = public_keys.sample

public_keys.clear

#array of potential private keys
private_keys = []
i = 2
while private_keys.size < 5
  #if satisfies the equation e * d = 1 mod phi
  if i * e % phi == 1
    private_keys << i
  end
  i += 1
end

d = private_keys.sample

private_keys.clear

puts "Public key: (#{e}), (#{n})"
puts "Private key: (#{d}), (#{n})"

