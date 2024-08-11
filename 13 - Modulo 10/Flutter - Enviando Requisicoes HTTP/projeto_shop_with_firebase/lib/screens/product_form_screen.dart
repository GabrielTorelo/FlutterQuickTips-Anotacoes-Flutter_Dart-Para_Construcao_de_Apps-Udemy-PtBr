import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _imageUrlFocusNode = FocusNode();
  final TextEditingController _imageUrlController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  Timer? _debounce;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final product = ModalRoute.of(context)?.settings.arguments as Product?;

      if (product != null) {
        _formData['id'] = product.id;
        _formData['title'] = product.title;
        _formData['price'] = product.price.toString();
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = _formData['imageUrl'];
      } else {
        _formData['price'] = '';
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    _debounce?.cancel();
  }

  void _updateImageUrl() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    Provider.of<ProductList>(
      context,
      listen: false,
    ).saveProduct(_formData).then((_) {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    }).catchError(
      (_) {
        setState(() => _isLoading = false);
        showDialog(
          context: context,
          builder: (_) => const AlertError(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submitForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      maxLength: 24,
                      initialValue: _formData['title']?.toString(),
                      decoration: const InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_priceFocusNode),
                      onSaved: (value) => _formData['title'] = value,
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a title',
                          _ => value!.trim().length < 4
                              ? 'Title must be at least 4 characters long'
                              : null,
                        };
                      },
                    ),
                    TextFormField(
                      maxLength: 7,
                      initialValue: _formData['price']?.toString(),
                      decoration: const InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode),
                      onSaved: (value) => _formData['price'] = value,
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a price',
                          _ => double.tryParse(value!) == null
                              ? 'Please enter a valid number'
                              : double.parse(value) <= 0
                                  ? 'Please enter a number greater than zero'
                                  : null,
                        };
                      },
                    ),
                    TextFormField(
                      maxLength: 130,
                      initialValue: _formData['description']?.toString(),
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      focusNode: _descriptionFocusNode,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) => _formData['description'] = value,
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a description',
                          _ => value!.trim().length < 10
                              ? 'Description must be at least 10 characters long'
                              : null,
                        };
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLength: 150,
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            textInputAction: TextInputAction.done,
                            focusNode: _imageUrlFocusNode,
                            keyboardType: TextInputType.url,
                            controller: _imageUrlController,
                            onChanged: (_) => _updateImageUrl(),
                            onFieldSubmitted: (_) => _submitForm(),
                            onSaved: (value) => _formData['imageUrl'] = value,
                            validator: (value) {
                              return switch (value?.trim()) {
                                '' || null => 'Please enter a image URL',
                                _ => Uri.tryParse(value!.trim()) == null
                                    ? 'Please enter a valid URL'
                                    : null,
                              };
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          child: Ink(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: _imageUrlController.text.isEmpty
                                ? const Center(
                                    child: Text('Preview'),
                                  )
                                : Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Center(
                                      child: Text('Invalid URL'),
                                    ),
                                    loadingBuilder:
                                        (_, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }

                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
