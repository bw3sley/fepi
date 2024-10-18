document.querySelectorAll('.movie a').forEach(movieLink => {
    movieLink.addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = this.href;
    });
});
