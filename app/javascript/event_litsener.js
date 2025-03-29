// app/javascript/application.js
document.addEventListener('DOMContentLoaded', function() {
    // Initialize star rating display
    document.querySelectorAll('.star-rating').forEach(element => {
      const rating = parseFloat(element.getAttribute('data-rating'));
      element.style.setProperty('--rating', rating);
    });
    
    // Handle star rating input
    const starInputs = document.querySelectorAll('.star-rating-input input');
    starInputs.forEach(input => {
      input.addEventListener('change', function() {
        const labels = this.parentElement.querySelectorAll('label');
        labels.forEach(label => {
          label.style.color = '#ddd';
        });
        
        let current = this;
        while(current) {
          if(current.tagName === 'LABEL') {
            current.style.color = '#f8ce0b';
          }
          current = current.previousElementSibling;
        }
      });
    });
  });