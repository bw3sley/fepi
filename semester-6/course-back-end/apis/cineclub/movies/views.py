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
        1: {'title': 'Inception', 'poster': 'inception.jpg', 'synopsis': 'A skilled thief is given a chance at redemption if he can successfully perform inception.', 'cast': ['Leonardo DiCaprio', 'Joseph Gordon-Levitt']},
        2: {'title': 'Interstellar', 'poster': 'interstellar.jpg', 'synopsis': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 'cast': ['Matthew McConaughey', 'Anne Hathaway']},
        3: {'title': 'The Dark Knight', 'poster': 'the-dark-knight.jpg', 'synopsis': 'Batman must accept one of the greatest psychological and physical tests when he faces the Joker.', 'cast': ['Christian Bale', 'Heath Ledger']},
    }.get(movie_id)

    return render(request, 'movies/movie-detail.html', {'movie': movie})
