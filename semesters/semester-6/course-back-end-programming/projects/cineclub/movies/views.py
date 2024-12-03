from django.shortcuts import render

def home(request):
    movies = [
        {'id': 1, 'title': 'Inception', 'poster': 'inception.jpg'},
        {'id': 2, 'title': 'Interstellar', 'poster': 'interstellar.jpg'},
        {'id': 3, 'title': 'The Dark Knight', 'poster': 'the-dark-knight.jpg'},
    ]
    return render(request, 'movies/home.html', {'movies': movies})

def movie_detail(request, movie_id):
    # Informações fictícias sobre o filme
    movie = {
        1: {'title': 'Inception', 'poster': 'inception.jpg', 'synopsis': 'Em um mundo onde é possível entrar na mente humana, Cobb (Leonardo DiCaprio) está entre os melhores na arte de roubar segredos valiosos do inconsciente, durante o estado de sono. Além disto ele é um fugitivo, pois está impedido de retornar aos Estados Unidos devido à morte de Mal (Marion Cotillard). Desesperado para rever seus filhos, Cobb aceita a ousada missão proposta por Saito (Ken Watanabe), um empresário japonês: entrar na mente de Richard Fischer (Cillian Murphy), o herdeiro de um império econômico, e plantar a ideia de desmembrá-lo. Para realizar este feito ele conta com a ajuda do parceiro Arthur (Joseph Gordon-Levitt), a inexperiente arquiteta de sonhos Ariadne (Ellen Page) e Eames (Tom Hardy), que consegue se disfarçar de forma precisa no mundo dos sonhos.', 'cast': ['Leonardo DiCaprio', 'Joseph Gordon-Levitt']},
        2: {'title': 'Interstellar', 'poster': 'interstellar.jpg', 'synopsis': 'Após ver a Terra consumindo boa parte de suas reservas naturais, um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper (Matthew McConaughey) é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand (Anne Hathaway), Jenkins (Marlon Sanders) e Doyle (Wes Bentley), ele seguirá em busca de uma nova casa. Com o passar dos anos, sua filha Murph (Mackenzie Foy e Jessica Chastain) investirá numa própria jornada para também tentar salvar a população do planeta.', 'cast': ['Matthew McConaughey', 'Anne Hathaway']},
        3: {'title': 'The Dark Knight', 'poster': 'the-dark-knight.jpg', 'synopsis': 'Após dois anos desde o surgimento do Batman (Christian Bale), os criminosos de Gotham City têm muito o que temer. Com a ajuda do tenente James Gordon (Gary Oldman) e do promotor público Harvey Dent (Aaron Eckhart), Batman luta contra o crime organizado. Acuados com o combate, os chefes do crime aceitam a proposta feita pelo Coringa (Heath Ledger) e o contratam para combater o Homem-Morcego..', 'cast': ['Christian Bale', 'Heath Ledger']},
    }.get(movie_id)

    return render(request, 'movies/movie-detail.html', {'movie': movie})
