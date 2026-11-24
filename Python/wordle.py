import time
import re
word = "chaussure"
continuer=True
while continuer:
    time.sleep(1)
    print(f"Le mot contient {len(word)} lettres")
    while True:
        time.sleep(1)
        guess = input("Essaie de trouver le mot (écris ta proposition) :\n")
        if len(guess) == len(word):
            break
        else:
            time.sleep(1)
            print(f"Merci de renseigner un mot avec {len(word)} lettres")
    x=0
    resultat = []
    for i in guess:
        if i == word[x]:
            resultat.append("🟩")
            x += 1
        elif i in word:
            resultat.append("🟨")
            x += 1
        else:
            resultat.append("🟥")
            x += 1
    print("".join(resultat))
    if guess == word:
        time.sleep(1)
        print("Bravo vous avez trouvé le mot !")
    while True:
        time.sleep(1)
        rejouer = input("Voulez-vous rejouer ? \n" )

        oui = re.fullmatch("oui" or "o" or "yes" or "y", rejouer, flags=re.IGNORECASE)
        non = re.fullmatch("non" or "no" or "n", rejouer, flags=re.IGNORECASE)

        if oui:
            time.sleep(1)
            break
        elif non:
            time.sleep(1)
            print("Merci d'avoir joué")
            continuer=False
            break
        else:
            time.sleep(1)
            print("merci de répondre de répondre avec une réponse appropriée")
