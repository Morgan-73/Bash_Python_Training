import random
import re
import time
import unicodedata


# choisir mot random
def mot():
    with open("assets/mots.txt") as f:
        all_text = f.read()
        words = list(map(str, all_text.split()))
        return random.choice(words).lower()


# permet de normaliser (retirer les accents, etc.) le mot choisit au hasard
def normaliser(mot):
    return "".join(
        c for c in unicodedata.normalize("NFD", mot) if unicodedata.category(c) != "Mn"
    )


# charge les mots qui seront utilisés pour vérifier si le mot proposé par l'utilisateur est valide
def charger_mots(chemin):
    with open(chemin, encoding="utf-8") as f:
        return {normaliser(ligne.strip().lower()) for ligne in f}


# variable qui stocke les mots chargés
MOTS = charger_mots("./assets/liste_francais_utf8.txt")


# vérifie si le mot est valide à partir des mots chargés précédemment
def est_valide(mot):
    return normaliser(mot.lower()) in MOTS


continuer = True  # variable pour pouvoir sortir de la boucle principale


def evaluer(guess, word):
    resultat = ["🟥"] * len(word)
    restantes = list(word)

    for i in range(len(word)):
        if guess[i] == word[i]:
            resultat[i] = "🟩"
            restantes.remove(guess[i])

    for i in range(len(word)):
        if resultat[i] == "🟥" and guess[i] in restantes:
            resultat[i] = "🟨"
            restantes.remove(guess[i])
    return "".join(resultat)


# boucle pour le script entier pour pouvoir recommencer depuis le début
while continuer:
    bouton_resultat = True  # on rallume la boucle qui contient l'évaluation du résultat
    word = mot()
    time.sleep(1)
    print(f"Le mot contient {len(word)} lettres")

    while bouton_resultat:
        # boucle pour checker taille mot proposé
        while True:
            time.sleep(1)
            guess = input("Essaie de trouver le mot (écris ta proposition) :\n")
            guess = guess.replace(" ", "")
            if len(guess) == len(word) and est_valide(guess):
                break
            elif len(guess) == len(word) and est_valide(guess) == False:
                print("Merci de renseigner un mot valide")
                continue
            else:
                time.sleep(1)
                print(f"Merci de renseigner un mot avec {len(word)} lettres")

        # boucle pour créer string de résultat + sort de la boucle si guess = word
        while True:
            guess_complet = evaluer(guess, word)
            print(guess_complet)
            # vérifie si la proposition est bonne
            if guess == word:
                time.sleep(1)
                bouton_resultat = False
                break
            else:
                time.sleep(1)
                break

    print("Bravo vous avez trouvé le mot !")

    # boucle pour checker si input pour question "rejouer" est correct
    while True:
        time.sleep(1)
        rejouer = input("Voulez-vous rejouer ? \n")
        rejouer = rejouer.replace(" ", "")

        oui = re.fullmatch("oui" or "o" or "yes" or "y", rejouer, flags=re.IGNORECASE)
        non = re.fullmatch("non" or "no" or "n", rejouer, flags=re.IGNORECASE)

        if oui:
            time.sleep(1)
            break
        elif non:
            time.sleep(1)
            print("Merci d'avoir joué !")
            continuer = False
            break
        else:
            time.sleep(1)
            print("Merci de répondre de répondre avec une réponse appropriée")
