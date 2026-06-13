// Scroll to top
const backToTopBtn = document.getElementById('backToTop');

if (backToTopBtn) {
    // Window scroll event
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            backToTopBtn.classList.add('show');
        } else {
            backToTopBtn.classList.remove('show');
        }
    });

    // Click scroll event
    backToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Project data moved to scripts/projects-data.js and exposed as window.projectsData

// Get filter buttons
const filterBtns = document.querySelectorAll('.filter-btn');
// Get project cards
const projectCards = document.querySelectorAll('.project-card');

// Filter button click
filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Clear active class
        filterBtns.forEach(b => b.classList.remove('active'));
        // Set active class
        btn.classList.add('active');

        // Get filter value
        const filterValue = btn.getAttribute('data-filter');

        // Loop project cards
        projectCards.forEach(card => {
            // Check card category
            if (filterValue === 'all' || card.getAttribute('data-category') === filterValue) {
                // Show card
                card.style.display = 'block';
            } else {
                // Hide card
                card.style.display = 'none';
            }
        });
    });
});

// Get modal elements
const modal = document.getElementById('projectModal');
const closeBtn = document.querySelector('.close-btn');
const projectData = window.projectsData || [];

// Open modal click
if (modal) {
    projectCards.forEach((card) => {
        card.addEventListener('click', () => {
            const idAttr = card.getAttribute('data-id');
            const pid = idAttr ? parseInt(idAttr, 10) : null;
            const project = projectData.find(p => p.id === pid) || projectData[0];

            if (!project) {
                return;
            }

            // Set modal data
            document.getElementById('modalImage').src = project.image;
            document.getElementById('modalTitle').textContent = project.title;
            document.getElementById('modalCategory').textContent = project.category.toUpperCase();
            document.getElementById('modalDescription').textContent = project.description;
            document.getElementById('modalDetails').textContent = project.details;
            document.getElementById('demoLink').href = project.demoLink;
            document.getElementById('githubLink').href = project.githubLink;

            modal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        });
    });

    if (closeBtn) {
        // Close modal click
        closeBtn.addEventListener('click', () => {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        });
    }

    // Window click close
    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    });
}

// Nav link click
document.querySelectorAll('.glass-nav a').forEach(link => {
    link.addEventListener('click', (e) => {
        const href = link.getAttribute('href');
        
        // Only prevent default if it's a hash on the current page
        if (href.startsWith('#') || href.includes(window.location.pathname.split('/').pop() + '#')) {
            const targetId = href.split('#')[1];
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }
    });
});
