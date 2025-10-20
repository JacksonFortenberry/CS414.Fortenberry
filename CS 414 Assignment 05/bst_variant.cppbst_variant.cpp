#include <iostream>
#include <variant>
#include <memory>
#include <queue>

// Define our basic tree node types
struct Empty {};

struct Node {
    int value;
    std::unique_ptr<struct Tree> left;
    std::unique_ptr<struct Tree> right;
};

// Variant type like OCaml's "type binary_tree = Empty | Node of ..."
using Tree = std::variant<Empty, Node>;

// --- Traversal helpers ---

// Inorder: left -> value -> right
void inorder(const Tree& t) {
    struct Visitor {
        void operator()(const Empty&) const { }
        void operator()(const Node& n) const {
            inorder(*n.left);
            std::cout << n.value << " ";
            inorder(*n.right);
        }
    };
    std::visit(Visitor{}, t);
}

// Preorder: value -> left -> right
void preorder(const Tree& t) {
    struct Visitor {
        void operator()(const Empty&) const { }
        void operator()(const Node& n) const {
            std::cout << n.value << " ";
            preorder(*n.left);
            preorder(*n.right);
        }
    };
    std::visit(Visitor{}, t);
}

// Postorder: left -> right -> value
void postorder(const Tree& t) {
    struct Visitor {
        void operator()(const Empty&) const { }
        void operator()(const Node& n) const {
            postorder(*n.left);
            postorder(*n.right);
            std::cout << n.value << " ";
        }
    };
    std::visit(Visitor{}, t);
}

// --- Utility functions ---

// Insert a value into BST
Tree insert(Tree t, int val) {
    struct Inserter {
        int val;
        Tree operator()(Empty) {
            return Node{val,
                        std::make_unique<Tree>(Empty{}),
                        std::make_unique<Tree>(Empty{})};
        }
        Tree operator()(Node n) {
            if (val < n.value)
                *n.left = insert(*n.left, val);
            else if (val > n.value)
                *n.right = insert(*n.right, val);
            return n;
        }
    };
    return std::visit(Inserter{val}, std::move(t));
}

// --- main test ---
int main() {
    Tree t = Empty{};

    // Build a simple BST
    t = insert(std::move(t), 5);
    t = insert(std::move(t), 3);
    t = insert(std::move(t), 7);
    t = insert(std::move(t), 1);
    t = insert(std::move(t), 4);

    std::cout << "Inorder: ";
    inorder(t);
    std::cout << "\nPreorder: ";
    preorder(t);
    std::cout << "\nPostorder: ";
    postorder(t);
    std::cout << "\n";

    return 0;
}
