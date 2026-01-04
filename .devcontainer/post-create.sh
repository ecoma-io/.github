#!/bin/bash
set -e

echo "Setting up development environment..."

# Initialize lefthook
echo "Installing git hooks with lefthook..."
lefthook install

# # Verify installations
echo ""
echo "Verifying installations..."
echo "✓ dprint: $(dprint --version)"
echo "✓ shellcheck: $(shellcheck --version | head -n 2 | tail -n 1)"
echo "✓ lefthook: $(lefthook version)"
echo "✓ conform: $(conform version)"
echo "✓ shfmt: $(shfmt --version)"

echo ""
echo "Development environment setup complete!"

echo ""
echo "📢 Remember to run esign to update your commit signing key!"
