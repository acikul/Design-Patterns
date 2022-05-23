def mymax(iterable, key=None):
    # incijaliziraj maksimalni element i maksimalni kljuc
    max_x=max_key=None

    # obidi sve elemente
    for x in iterable:
        if key==None:
            if max_x == None:
                max_x = x
            # ako je x najveci -> azuriraj max_x
            if x > max_x:
                max_x = x
        else:
            if max_key == None:
                max_x = x
                max_key = key(x)
            # ako je key(x) najveci -> azuriraj max_x i max_key
            if key(x) > max_key:
                max_key = key(x)
                max_x = x
    # vrati rezultat
    return max_x

maxint = mymax([1, 3, 5, 7, 4, 6, 9, 2, 0])
maxstring = mymax(["Gle", "malu", "vocku", "poslije", "kise","Puna", "je", "kapi", "pa", "ih", "njise"], key = str)
maxLenString = mymax(["Gle", "malu", "vocku", "poslije", "kise","Puna", "je", "kapi", "pa", "ih", "njise"], key = lambda x: len(str(x)))

print(maxint)
print(maxstring)
print(maxLenString)

D = {'burek':8, 'buhtla':5}
maxD = mymax(D, key = D.get)
print(maxD)

osobe = [("Ana", "Anić"), ("Marko", "Horvat"), ("Ivan", "Horvat"), ("Marko", "Marić")]
print(mymax(osobe))
