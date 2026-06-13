(function () {
    const usersKey = 'hackClubUsers';
    const currentUserKey = 'hackCurrentUser';

    function loadUsers() {
        try {
            return JSON.parse(localStorage.getItem(usersKey) || '[]');
        } catch (error) {
            return [];
        }
    }

    function saveUsers(users) {
        localStorage.setItem(usersKey, JSON.stringify(users));
    }

    function setStatus(element, message, isError) {
        if (!element) {
            return;
        }

        element.textContent = message || '';
        element.classList.toggle('error', Boolean(isError));
    }

    function normalizeEmail(email) {
        return String(email || '').trim().toLowerCase();
    }

    function formatDate(dateValue) {
        const date = new Date(dateValue);
        if (Number.isNaN(date.getTime())) {
            return 'Recently';
        }

        return date.toLocaleString([], {
            year: 'numeric',
            month: 'short',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', (event) => {
            event.preventDefault();
            const status = document.getElementById('registerStatus');
            const formData = new FormData(registerForm);
            const fullName = String(formData.get('fullName') || '').trim();
            const email = normalizeEmail(formData.get('email'));
            const department = String(formData.get('department') || '').trim();
            const yearLevel = String(formData.get('yearLevel') || '').trim();
            const interest = String(formData.get('interest') || '').trim();
            const bio = String(formData.get('bio') || '').trim();
            const password = String(formData.get('password') || '');
            const confirmPassword = String(formData.get('confirmPassword') || '');

            if (!fullName || !email || !department || !yearLevel || !password) {
                setStatus(status, 'Please complete the required fields.', true);
                return;
            }

            if (password.length < 6) {
                setStatus(status, 'Password must be at least 6 characters long.', true);
                return;
            }

            if (password !== confirmPassword) {
                setStatus(status, 'Passwords do not match.', true);
                return;
            }

            const users = loadUsers();
            if (users.some((user) => normalizeEmail(user.email) === email)) {
                setStatus(status, 'An account with this email already exists.', true);
                return;
            }

            const user = {
                fullName,
                email,
                department,
                yearLevel,
                interest,
                bio,
                password,
                createdAt: new Date().toISOString(),
                lastLoginAt: new Date().toISOString()
            };

            users.push(user);
            saveUsers(users);
            sessionStorage.setItem(currentUserKey, email);
            setStatus(status, 'Registration complete. Redirecting to profile...', false);
            window.setTimeout(() => {
                window.location.href = 'profile.html';
            }, 400);
        });
    }

    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', (event) => {
            event.preventDefault();
            const status = document.getElementById('loginStatus');
            const formData = new FormData(loginForm);
            const email = normalizeEmail(formData.get('email'));
            const password = String(formData.get('password') || '');
            const users = loadUsers();
            const user = users.find((item) => normalizeEmail(item.email) === email && item.password === password);

            if (!user) {
                setStatus(status, 'Invalid email or password.', true);
                return;
            }

            user.lastLoginAt = new Date().toISOString();
            saveUsers(users);
            sessionStorage.setItem(currentUserKey, user.email);
            setStatus(status, 'Login successful. Redirecting...', false);
            window.setTimeout(() => {
                window.location.href = 'profile.html';
            }, 400);
        });
    }

    const profileName = document.getElementById('profileName');
    if (profileName) {
        const status = document.getElementById('profileStatus');
        const email = sessionStorage.getItem(currentUserKey);
        const users = loadUsers();
        const user = users.find((item) => normalizeEmail(item.email) === normalizeEmail(email));

        if (!user) {
            setStatus(status, 'No signed-in user found. Showing a blank profile.', true);
            document.getElementById('profileEmail').textContent = 'Sign in to load your profile.';
        } else {
            profileName.textContent = user.fullName;
            document.getElementById('profileEmail').textContent = user.email;
            document.getElementById('profileDepartment').textContent = user.department || '-';
            document.getElementById('profileYearLevel').textContent = user.yearLevel || '-';
            document.getElementById('profileInterest').textContent = user.interest || '-';
            document.getElementById('profileCreated').textContent = formatDate(user.createdAt);
            document.getElementById('profileBio').textContent = user.bio || 'No bio provided.';
            setStatus(status, 'Profile loaded from your saved registration details.', false);
        }

        const logoutButton = document.getElementById('logoutButton');
        if (logoutButton) {
            logoutButton.addEventListener('click', () => {
                sessionStorage.removeItem(currentUserKey);
                window.location.href = 'login.html';
            });
        }
    }
})();