library(plumber)
library(vetiver)

# Charger le modèle
# Remplacez `model_fit` par votre modèle entraîné
v <- vetiver_model(final_fit_rf, "Random Forest")

#* @post /predict
#* @param input Le texte d'entrée pour les prédictions
predict_function <- function(req) {
  # Obtenez les données depuis le corps de la requête
  data <- jsonlite::fromJSON(req$postBody)
  
  # Faites une prédiction avec le modèle
  prediction <- vetiver_predict(v, data)
  
  # Retournez la prédiction
  return(prediction)
}
