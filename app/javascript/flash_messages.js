// Function to fade out and remove flash messages
function fadeOutFlashMessages() {
    const notice = document.getElementById('flash-notice');
    const alert = document.getElementById('flash-alert');

    if (notice) {
        setTimeout(() => {
            notice.classList.remove('show');
            notice.classList.add('fade');
            // Remove the element after the fade-out transition
            setTimeout(() => notice.remove(), 300); // Adjust the timeout based on the CSS transition duration
        }, 2000); // 2 seconds
    }

    if (alert) {
        setTimeout(() => {
            alert.classList.remove('show');
            alert.classList.add('fade');
            // Remove the element after the fade-out transition
            setTimeout(() => alert.remove(), 300); // Adjust the timeout based on the CSS transition duration
        }, 2000); // 2 seconds
    }
}
fadeOutFlashMessages();
// document.addEventListener("DOMContentLoaded", fadeOutFlashMessages);

