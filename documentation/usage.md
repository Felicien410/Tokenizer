# Guide d'Utilisation du Token U42

## Les bases
Plusieurs actions possibles avec le token U42 - (norme ERC20) :
- En envoyer à d'autres
- En recevoir
- Les brûler (détruire)
- En créer de nouveaux (si t'es le owner)

## Comment vérifier ton solde
1. Ouvre MetaMask
2. Assure-toi d'être sur BSC Testnet
3. Regarde le montant de U42 affiché

## Envoyer des tokens
1. Dans MetaMask :
   - Clique sur ton token U42
   - Appuie sur "Envoyer"
   - Mets l'adresse du destinataire
   - Choisis le montant
   - Confirme et paie les frais en BNB

## Pour le owner uniquement
Si t'es le propriétaire du contrat, tu peux :

### Créer de nouveaux tokens (mint)
```javascript
// Dans la console Truffle
const token = await Uranium42.at("0xDa7909E25fA5f46424C43fe7591df8CADD3Ebdc4")
await token.mint("adresse_destinataire", montant)
```

### Arrêter le minting définitivement
```javascript
await token.finishMinting()
```

## Pour tout le monde
### Brûler tes tokens
```javascript
await token.burn(montant)
```

## Truc important à savoir
- Il peut y avoir max 42000 tokens
- Une fois le minting arrêté, on peut plus créer de nouveaux tokens
- Les tokens brûlés sont perdus pour toujours
- MetaMask bug un peu avec l'affichage des décimales, mais t'inquiète ça marche quand même

## Où voir les transactions
Toutes les transactions sont visibles sur BscScan Testnet :
https://testnet.bscscan.com/token/0xDa7909E25fA5f46424C43fe7591df8CADD3Ebdc4