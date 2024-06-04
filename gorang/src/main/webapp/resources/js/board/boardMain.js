    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.common-item').forEach(item => {
            item.addEventListener('click', function() {
                const boardNo = this.getAttribute('data-board-no');
                if (boardNo) {
                    location.href = `detail.bo?boardNo=${boardNo}`;
                } else {
                    console.error('Invalid board number');
                }
            });
        });
    });
 